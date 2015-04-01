package com.acception.util

import java.text.*
import java.io.File;
import java.math.BigDecimal;

import com.acception.authentication.Usuario
import com.acception.usuario.Telefone
import grails.util.Environment
import static java.util.UUID.randomUUID
import java.math.RoundingMode

class Util {
	static def generateUUID() {
		def uuid=(randomUUID() as String).toUpperCase()
	}
	
	static def handleSpecialChar(obj){
		if (obj instanceof String) {
			replaceSpecialChars(obj)
		} else if (obj instanceof Map) {
			obj.each {k,v->
				if (v && v instanceof java.lang.String){
					obj[k]=replaceSpecialChars(v)
				}
			}
			obj
		} else {
			def fds=obj.getClass().declaredFields.findAll {(it.modifiers==2) && !it.name.startsWith('_')}
				.findAll {(it.type==java.lang.String)}
				.collect {it.name}
			fds.each {
				obj[it]=replaceSpecialChars(obj[it]);
			}
			obj
		}
	}
	static def replaceSpecialChars(s){
		if (s) {
			def t=s.replaceAll('ç','c')
			t=t.replaceAll('Ç','C')
			t=t.replaceAll('á','a')
			t=t.replaceAll('à','a')
			t=t.replaceAll('â','a')
			t=t.replaceAll('ã','a')
			t=t.replaceAll('é','e')
			t=t.replaceAll('ê','e')
			t=t.replaceAll('í','i')
			t=t.replaceAll('ó','o')
			t=t.replaceAll('õ','o')
			t=t.replaceAll('ô','o')
			t=t.replaceAll('ú','u')
			t=t.replaceAll('Á','A')
			t=t.replaceAll('À','A')
			t=t.replaceAll('Â','A')
			t=t.replaceAll('Ã','A')
			t=t.replaceAll('É','E')
			t=t.replaceAll('Ê','E')
			t=t.replaceAll('Í','I')
			t=t.replaceAll('Ó','O')
			t=t.replaceAll('Õ','O')
			t=t.replaceAll('Ô','O')
			t=t.replaceAll('Ú','U')
			t=t.replaceAll('ª','a')
			t=t.replaceAll('º','o')
			t
		} else {
			s
		}
	}
	static def getExtension(String fileName) {
		fileName = fileName.trim();
		int dotPos = fileName.lastIndexOf(".");
		def	extension = fileName.substring(dotPos+1);
		extension
	}
	static Date lastSecond(Date d) {
		Calendar cal=new GregorianCalendar()
		cal.setTime(d)
		cal.set(Calendar.HOUR_OF_DAY,23)
		cal.set(Calendar.MINUTE,59)
		cal.set(Calendar.SECOND,59)
		cal.set(Calendar.MILLISECOND,999)
		cal.getTime()
	}
	
	static Date firstSecond(Date d){
		Calendar cal=new GregorianCalendar()
		cal.setTime(d)
		cal.set(Calendar.HOUR_OF_DAY,0)
		cal.set(Calendar.MINUTE,0)
		cal.set(Calendar.SECOND,0)
		cal.set(Calendar.MILLISECOND,0)
		cal.getTime()
	}
	
	
	static Date truncDate(d){
		Calendar cal=new GregorianCalendar()
		cal.setTime(d)
		cal.set(Calendar.HOUR_OF_DAY,0)
		cal.set(Calendar.MINUTE,0)
		cal.set(Calendar.SECOND,0)
		cal.set(Calendar.MILLISECOND,0)
		cal.getTime()
	}
	
	static String capitalize(String s) {
		char[] chars = s.toCharArray()
		chars[0] = Character.toUpperCase(chars[0])
		return new String(chars)
	}
	static public  boolean validaCpf(String strCpf,formated=false){
		def f= (!formated) || (strCpf==~ /^([0-9]{3}\.){2}[0-9]{3}-[0-9]{2}$/) 
		if (f) {
			if (! strCpf.substring(0,1).equals("")){
				try{
					boolean validado=true;
					int     d1, d2;
					int     dg1, dg2, resto;
					int     dgCPF;
					String  nDigResult;
					strCpf=strCpf.replace('.',' ');
					strCpf=strCpf.replace('-',' ');
					strCpf=strCpf.replaceAll(" ","");
					d1 = d2 = 0;
					dg1 = dg2 = resto = 0;
					for (int nCount = 1; nCount < strCpf.length() -1; nCount++) {
						dgCPF = Integer.valueOf(strCpf.substring(nCount -1, nCount)).intValue();
						d1 = d1 + ( 11 - nCount ) * dgCPF;
						d2 = d2 + ( 12 - nCount ) * dgCPF;
					};
					resto = (d1 % 11);
					if (resto < 2) dg1 = 0;
					else dg1 = 11 - resto;
					d2 += 2 * dg1;
					resto = (d2 % 11);
					if (resto < 2) dg2 = 0;
					else dg2 = 11 - resto;
					String nDigVerific = strCpf.substring(strCpf.length()-2, strCpf.length());
					nDigResult = String.valueOf(dg1) + String.valueOf(dg2);
					return nDigVerific.equals(nDigResult);
				}catch (Exception e){
					return false;
				}
			}else return false;
		} else false
	}

	static public boolean validaCnpj( String str_cnpj, formated=false ) {
		 def f= (!formated) || (str_cnpj==~ /^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}$/) || (str_cnpj ==~ /^[0-9]{14}$/)
		 if (f) {
			if (! str_cnpj.substring(0,1).equals("")){
				try{
					str_cnpj=str_cnpj.replace('.',' ');
					str_cnpj=str_cnpj.replace('/',' ');
					str_cnpj=str_cnpj.replace('-',' ');
					str_cnpj=str_cnpj.replaceAll(" ","");
					int soma = 0, aux, dig;
					String cnpj_calc = str_cnpj.substring(0,12);
	
					if ( str_cnpj.length() != 14 ) return false;
					char[] chr_cnpj = str_cnpj.toCharArray();
					for( int i = 0; i < 4; i++ )
						if ( chr_cnpj[i]-48 >=0 && chr_cnpj[i]-48 <=9 ) soma += (chr_cnpj[i] - 48 ) * (6 - (i + 1)) ;
					for( int i = 0; i < 8; i++ )
						if ( chr_cnpj[i+4]-48 >=0 && chr_cnpj[i+4]-48 <=9 ) soma += (chr_cnpj[i+4] - 48 ) * (10 - (i + 1)) ;
					dig = 11 - (soma % 11);
					cnpj_calc += ( dig == 10 || dig == 11 ) ? "0" : Integer.toString(dig);
					soma = 0;
					for ( int i = 0; i < 5; i++ )
						if ( chr_cnpj[i]-48 >=0 && chr_cnpj[i]-48 <=9 ) soma += (chr_cnpj[i] - 48 ) * (7 - (i + 1)) ;
					for ( int i = 0; i < 8; i++ )
						if ( chr_cnpj[i+5]-48 >=0 && chr_cnpj[i+5]-48 <=9 ) soma += (chr_cnpj[i+5] - 48 ) * (10 - (i + 1)) ;
					dig = 11 - (soma % 11);
					cnpj_calc += ( dig == 10 || dig == 11 ) ? "0" : Integer.toString(dig);
					return str_cnpj.equals(cnpj_calc);
				}catch (Exception e){
					return false;
				}
			}else return false;
		 } else false
	 
	}
	
	static String limitTo(String s, int l) {
		if (s && s.size()>l)
			s.substring(0,l)
		else s
	}
	static String cepToRaw(cep){
		def raw=cep
		if (raw) {
			raw=raw.replace('.','')
			raw=raw.replace('-','')
		}
		raw
	}
	static String cnpjToRaw(cnpj){
		def raw=cnpj
		if (raw) {
			raw=raw.replace('.','')
			raw=raw.replace('-','')
			raw=raw.replace('/','')
		}
		 Util.leftPad(raw,14,(char)'0')
	}
	// 01 234 567 8901 23
	// 99.999.999/9999-99
	static String rawToCnpj(raw) {
        raw=raw.replace('.','')
        raw=raw.replace('-','')
        raw=raw.replace('/','')
        def a,b,c,d,e
        if (raw.size()>=2)
            a=raw.substring(0,2)
        else a=raw
        if (raw.size()>=5)
            b=raw.substring(2,5)
        else if (raw.size()>2) b=raw.substring(2,raw.size())
        if (raw.size()>=8)
            c=raw.substring(5,8)
        else if (raw.size()>5) c=raw.substring(5,raw.size())
        if (raw.size()>=12)
            d=raw.substring(8,12)
        else if (raw.size()>8) d=raw.substring(8,raw.size())
        if (raw.size()>=14)
            e=raw.substring(12,14)
        else if (raw.size()>12) d=raw.substring(12,raw.size())
        def r=""
        if (a) r=a
        if (b) r=r+'.'+b
        if (c) r=r+'.'+c
        if (d) r=r+'/'+d
        if (e) r=r+'-'+e
        r
	}
	static String cpfToRaw(cpf){
		def raw=cpf
		if (raw) {
			raw=raw.replace('.','')
			raw=raw.replace('-','')
		}
		Util.leftPad(raw,11,(char)'0')
	}
	static String rawToCpf(raw) {
		raw=raw.replace('.','')
		raw=raw.replace('-','')
		def a,b,c,d
		if (raw.size()>=3)
			a=raw.substring(0,3)
		else a=raw
		if (raw.size()>=6)
			b=raw.substring(3,6)
		else if (raw.size()>3) b=raw.substring(3,raw.size())
		if (raw.size()>=9)
			c=raw.substring(6,9)
		else if (raw.size()>6) c=raw.substring(6,raw.size())
		if (raw.size()>=11)
			d=raw.substring(9,11)
		else if (raw.size()>9) d=raw.substring(9,raw.size())
		def r=""
		if (a) r=a
		if (b) r=r+'.'+b
		if (c) r=r+'.'+c
		if (d) r=r+'-'+d
		r
	}
	
	static boolean mapPertence(l, elem) {
		def r=false
		l.each { m ->
			def p=true
			m.each { k, v ->
				if (elem[k]!=v) p=false
			}
			if (p) r=true
		}
		r
	}
	
	static String leftTrimChar(String s,c) {
		def l=0
		for(def i=0;i<s.size();i++) {
			if (s[i]!=c) {
			   l=i
			   break
			}
		}
		s.substring(l)
	}
	static String leftPad(String s, int len, char c=' '){
		def t=s
		if (!t) t=''
		while(t.size()<len) t=c.toString()+t
		t
	}
	static def controllerName(obj) {
		def cls
		if(obj instanceof String) cls=obj
		else cls=obj.class.name
		def idx=cls.lastIndexOf('.')
		def ctrl
		if (idx==-1) ctrl=cls
		else ctrl=cls.substring(idx+1)
		def f=ctrl.substring(0,1).toLowerCase()
		def r=ctrl.substring(1)
		f+r
	}

	static def simpleDomainName(obj) {
		def cls=obj.class.name
		def idx=cls.lastIndexOf('.')
		def ctrl
		if (idx==-1) ctrl=cls
		else ctrl=cls.substring(idx+1)
		ctrl
	}
    static def readableClassName(String clsName) {
        def words=[]
        def upper
        def word=''
        def rup='A'..'Z'
        clsName.each {c->
            if (c=='.') {
                word=''
                words=[]
            } else if (!upper && (c in rup)) {
                if (word) words.add(word)
                word=c
                upper=true
            } else if (upper && word.size()>1 && !(c in rup)) {
                words.add(word[0..-2])
                word=word[-1]+c
            } else word+=c
            if (!(c in rup)) upper=false
        }
        if (word) words.add(word)
        words.join(' ')
    }
	// Converte a primeira letra de um string em lowcase (minuscula)
	static def firstLower(s){
		if (s) {
			def f=s.substring(0,1).toLowerCase()
			if (s.size()>1)
				return f+s.substring(1)
			else return f
		} else s
	}
	// Converte a primeira letra de um string em uppercase (maiuscula)
	static def firstUpper(s){
		if (s) {
			def f=s.substring(0,1).toUpperCase()
			if (s.size()>1)
				return f+s.substring(1)
			else return f
		} else s
	}
	
	// Obtem usuario a partir da sessão http
	static def getUser() {
		def ctx=grails.util.Holders.grailsApplication.mainContext
		def authenticateService = ctx.authenticateService
		def p=authenticateService.principal()
		if (p && !(p instanceof String)) {
			def u=authenticateService.principal()?.domainClass
			u=Usuario.get(u.id)
			return u
		} else return null
	}
	
	// obtem hora e minuto a partir de um string no formato HH:MM 
	// e coloca em um Map com as chaves (hora,minuto)
	static def getHora(String h) {
		def matcher= ( h=~ /^(\d{1,2})?(:(\d{1,2}))?$/ )
		if (matcher) {
			def hora=matcher[0][1] ? matcher[0][1].toInteger() : 0
			def min=matcher[0][3] ? matcher[0][3].toInteger() : 0
			[hora:hora,minutos:min]
		} else throw new RuntimeException("Hora inválida: ${h}")
	}
	// Obtem o stacktrace de uma exceção e converte paa string
	public static String getStackTrace(Throwable aThrowable) {
		final Writer result = new StringWriter();
		final PrintWriter printWriter = new PrintWriter(result);
		aThrowable.printStackTrace(printWriter);
		printWriter.flush();
		result.flush();
		return result.toString();
	  }
	
	
	// Verifica se dois cnpjs tem a mesma raiz AA.AAA.AAA/NNNN-DD e AA.AAA.AAA/MMMM-dd
	static def cnpjMesmaRaiz(cnpjA,cnpjB) {
		def ca=cnpjToRaw(cnpjA)
		def cb=cnpjToRaw(cnpjB)
		(ca.size()==14 &&  cb.size()==14 && ca.substring(0,8)==cb.substring(0,8))
	}
	static def raizCnpj(cnpj) {
		if (cnpj) {
			def ca=cnpjToRaw(cnpj)
			if (ca.size()==14) return ca.substring(0,8)
			else throw new RuntimeException("CNPJ inválido")
		}
	}
	static def formatRaizCnpj(raiz) {
		def raw=raiz.replace('.','')
		raw=raw.replace('-','')
		raw=raw.replace('/','')
		def a,b,c
		if (raw.size()>=2)
			a=raw.substring(0,2)
		else a=raw
		if (raw.size()>=5)
			b=raw.substring(2,5)
		else if (raw.size()>2) b=raw.substring(2,raw.size())
		if (raw.size()>=8)
			c=raw.substring(5,8)
		else if (raw.size()>5) c=raw.substring(5,raw.size())

		def r=""
		if (a) r=a
		if (b) r=r+'.'+b
		if (c) r=r+'.'+c
		r=r+'/****-**'
		r

	}
	static def stackTraceToString(t) {
		StringWriter sw =new StringWriter();
		PrintWriter pw =new PrintWriter(sw);
		t.printStackTrace(pw);
		sw.toString();
	}
	
	/**
	 * Generate a object valid name from a strings. Ex.:
	 * The fool from the hill -> theFoolFromTheHill
	 * Hello World. This is a Test -> helloWorldThisIsATest
	 * @param str
	 * @return
	 */
	static def canonicalName(String str,lowcase=true){
		if (str) {
			def n=Util.replaceSpecialChars(str)
			n=n.replaceAll(' ','_')
			n=n.replaceAll('\\.','_')
			n=n.replaceAll('-','_')
			def l=n.split('_')
			n=''
			l.eachWithIndex {s, i->
				def t=s
				if (i!=0 || !lowcase) {
					t=firstUpper(s)
				} else {
					t=firstLower(s)
				}
				n+=t
			}
			n
		} else 'null'
	}
	
	static boolean isValidDate(String date){
		if (date==null) return false
		if (date !=~ /^\d{1,2}\/\d{1,2}\/\d{4}/) return false
		def sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
		sdf.lenient=false
		Date d = null;
		try {
		    d = sdf.parse(date);
			return true
		} catch (ParseException e) {   
		    return false
		}
	}
	static def extractFileName(path) {
		def fn=path.lastIndexOf('/').with {it != -1 ? path.substring(it+1) : path}
		fn
	}
    static def extractPath(path) {
        def p=path.lastIndexOf('/').with {it != -1 ? path.substring(0,it) : ''}
        p
    }
    
    static def extractExtension(name) {
        def p=extractPath(name)
        def fn=extractFileName(name)
        def i=fn.lastIndexOf('.')
        if (i != -1) {
            def prf=fn.substring(0,i)
            def ext=fn.substring(i+1)
            [name:p+prf,ext:ext]
        } else {
            [name:p+fn, ext:'']
        }    
    }
	
	static  def uniqueFileName(path) {
        def fe=extractExtension(path)
        int n=0
        def fn=path
        def f=new File(fn)
        while (f.exists()) {
            n++
            def nfn=fe.name+n
            fn=fe.ext ? nfn+'.'+fe.ext : nfn
            f=new File(fn)
        }
        fn
    }
	static def copyFile(String from, String to) {
		def source=new File(from)
		def destination=new File(to)
		copyFile(source,destination)
	}
	
	static def copyFile(File source, File destination) {
		if (!source.exists()) throw new FileNotFoundException("File ${source.name} not found")
		destination.withDataOutputStream { os->
			source.withDataInputStream { is->
			   os << is
			}
		}
		true
	}
	
	static def moveFile(String from, String to) {
		def source=new File(from)
		def destination=new File(to)
		moveFile(source,destination)
	}
	
	static def moveFile(File source, File destination) {
		if (!source.exists()) throw new FileNotFoundException("File ${source.name} not found")
		destination.withDataOutputStream { os->
			source.withDataInputStream { is->
			   os << is
			}
		}
		source.delete()
	}
	
	static String addSlash(path) {
		def p=path
		if (p && p[p.size()-1]!='/') p=p+'/'
		p
	}
	
	static String calculaDvAgencia(String codigoBanco, String agencia) {
	    def ag=agencia
	    while(ag.size()<4) 
	        ag='0'+ag
	    
	    def d1=ag[0].toInteger()*5
	    def d2=ag[1].toInteger()*4
	    def d3=ag[2].toInteger()*3
	    def d4=ag[3].toInteger()*2
	    def s=d1+d2+d3+d4
	    def r= s % 11
		def dv
		if (r==0) dv=0
		else if (r==1) dv=0
	    else dv=11-r
	    dv.toString()    
	}
	
	static String formatToString(obj){
		if (obj instanceof Map) {
			def r="["
			def first=true
			obj.each {k,v->
				if(!first) r+=','
				def val=formatToString(v)
				r+="'${k}':${val}"
				if (first) first=false
			}
			r+="]"
			r
		} else if (obj instanceof List) {
			def r="["
			def first=true
			obj.each {v->
				if(!first) r+=','
				def val=formatToString(v)
				r+=val
				if (first) first=false
			}
			r+="]"
			r
		} else if (obj instanceof String) {
			return "'${obj}'"
		} else {
			return "'${obj.toString()}'"
		}
	}
	
	static montaDate(int dia,int mes,int ano) {
		def calendar=new GregorianCalendar()
		calendar.set(Calendar.DATE,dia)
		calendar.set(Calendar.MONTH,mes)
		calendar.set(Calendar.YEAR,ano)
		calendar.set(Calendar.HOUR,0)
		calendar.set(Calendar.MINUTE,0)
		calendar.set(Calendar.SECOND,0)
		calendar.set(Calendar.MILLISECOND,0)
		calendar.time
	}
	
	static def splitPath(path) {
		def p=/^(\/(.+\/)*){0,1}([^\/]*)$/
	    def m= path =~ p
		if (!m || !m[0] || m[0].size()<4) throw new RuntimeException("Nome de arquivo inválido: $path")
	    def filename=m[0][3]
	    def name=filename
	    def extension=''
	    def ip=filename.lastIndexOf('.')
	    if (ip!=-1) {
	        name=filename.substring(0,ip)
	        extension=filename.substring(ip+1)
	    }
	    [path:m[0][1] ?: '',filename:m[0][3] ?: '',name:name,extension:extension ?: '']
	}
	
	static String generateRandomCode(tam=8) {
			Random r=new Random(new Date().getTime());
			def m=('9'*tam).toInteger()
			Integer codAt=r.nextInt()%m;
			while(codAt==0) codAt=r.nextInt()%m;
			if(codAt<0) codAt*=-1;
			return String.format("%0${tam}d",codAt);
	}
	
	static boolean validaEmail(String email) {
		if (!email) return false
		def e=email.replaceAll(/\.\./,'.')
		e ==~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/  
	}
	static boolean validaTelefone(String telefone) {
		if (!telefone) return false
		telefone ==~/\({0,1}\d{2}\){0,1} *-{0,1} *(\d{4,5}) *-{0,1} *(\d{4})/
	}
	static Telefone extractTelefone(v) {
		if (v) {
			//def re=/(\d{2})* *(\d{4,5})-{0,1}(\d{4})/
			def re=/(\(?([0-9]?[0-9][0-9])\)?)?((-|\s)?)((-|\s)?)([0-9]{4}((-|\s)?)[0-9]{4,5})/  /* Modificada por Diego em 12/09/2014*/
			if (v && v ==~re) {
				def m = (v =~ re)
				def ddd=m[0][1]
				def numero=m[0][4]
				if(!ddd & !numero){
					numero=m[0][0]
				}
				if(" "){
					ddd=m[0][1]
					numero=m[0][7]
				}
                if(ddd && ddd.indexOf(")")>0){
                    ddd=m[0][2]
                }
				new Telefone(ddd:ddd, numero:numero)
			}else {
				null
			}
		} else null
		
	}
	
	static Double ptBrToDouble(String v) {
		Locale l = new Locale( "pt", "BR" );
		NumberFormat nf = NumberFormat.getNumberInstance(l);
		DecimalFormat df = (DecimalFormat) nf;
		return df.parse(v).toDouble()
	}
	
	static String formatPtBr(Double v) {
		Locale l = new Locale( "pt", "BR" );
		NumberFormat nf = NumberFormat.getNumberInstance(l);
		DecimalFormat df = (DecimalFormat) nf;
		df.applyPattern('#,##0.00')
		return df.format(v)

	}
	
	static def prepareMinOverflow(l,min,clos) {
		def r=[]
		def f
		l.each {
			if (clos(it)<min) {
				r.add(it)
			} else if (f && clos(it)<clos(f)) {
				f=it
			} else if (!f) {
				f=it
			}
		}
		if (f) r.add(f)
		r
	}
	
	static def getMinOverflow(la,lb,min,lc,clos) {
		if (la) {
			if (la && lb && (la.sum {clos(it)} + lb.sum {clos(it)}) < min) return null;
			def a=la[0]
			def s=lb ? (lb.sum{clos(it)} + clos(a)) : clos(a)
			def lm
			if (s == min) {
				lm= lb+a
				return lm
			} else if (s < min) {
				def ld=lb+a
				for (def j=1;j<la.size()-1;j++) {
					def le=la[j..-1]
					def lmm= getMinOverflow(le,ld,min,lc,clos)
					if (!lm && lmm) lm=lmm
					else if (lmm && lmm.sum {clos(it)} < lm.sum{clos(it)}) lm=lmm
					if (lm && lm.sum{clos(it)}==min) return lm
				}
				if (lm) {
					if (lc && (lc.sum {clos(it)} <= lm.sum {clos(it)}) ) lm=lc
				} else lm=lc
			} else {
				if (lc && (lc.sum {clos(it)} <= s) ) lm=lc
				else lm= lb+a
				if (lm.sum{clos(it)}==min) return lm
			}
			
			for (def j=1;j<la.size()-1;j++) {
				def le=la[j..-1]
				def lmm= getMinOverflow(le,[],min,lm,clos)
				if (!lm && lmm) lm=lmm
				else if (lmm && lmm.sum {clos(it)} < lm.sum{clos(it)}) lm=lmm
				if (lm.sum{clos(it)}==min) return lm
			}
			lm
		} else return lc
	}
	
	static def minOverflowBag(l,min,clos) {
		def lp=prepareMinOverflow(l,min,clos)
		lp=lp.sort {clos(it)}.reverse()
		def lc=getMinOverflow(lp,[],min,[],clos)
		lc
	}
	static def getBaseDir() {
		def env = System.getenv()
		switch (Environment.current) {
			case Environment.DEVELOPMENT:
				if (env['TRONCO_DEVELOPMENT_BASEDIR']) return env['TRONCO_DEVELOPMENT_BASEDIR']
				else return '/home/coadquirencia/.coadquirencia'
				break
			default:
				if (env['TRONCO_BASEDIR']) return env['TRONCO_BASEDIR']
				else return '/home/coadquirencia/.coadquirencia'
				break
		}

	}
	static def getHomeDir() {
		def env = System.getenv()
		switch (Environment.current) {
			case Environment.DEVELOPMENT:
				if (env['TRONCO_DEVELOPMENT_HOMEDIR']) return env['TRONCO_DEVELOPMENT_HOMEDIR']
				else return '/home/coadquirencia'
				break
			default:
				if (env['TRONCO_HOMEDIR']) return env['TRONCO_HOMEDIR']
				else return '/home/coadquirencia'
				break
		}

	}
	static def assertPath(path) {
		def f=new File(path)
		if (!f.exists()) f.mkdirs()
	}
	
	static def meses() {
		[[id:1, value:'Janeiro'],[id:2, value:'Fevereiro'],[id:3, value:'Março'],[id:4, value:'Abril'],[id:5, value:'Maio'],[id:6, value:'Junho'],[id:7, value:'Julho'],[id:8, value:'Agosto'],[id:9, value:'Setembro'],[id:10, value:'Outubro'],[id:11, value:'Novembro'],[id:12, value:'Dezembro']]
	}
	
	static def round(BigDecimal v,int d){
		def r=v.setScale(d+1,RoundingMode.DOWN)
		r=r.setScale(d,RoundingMode.UP)
	}
	static def padronizaCartao(p) {
		p.replaceAll(/\*+/,"*")
	}
	static def evalProperty(obj,String k) {
		def v=obj
		def lk=k.tokenize('.')
		lk.each {tk->
			v=v[tk]
		}
		v
	}
	static def generatePassword (length) {
		def allChars = [ 'A'..'Z', 'a'..'z', '0'..'9' ,'#','@','$'].flatten() - [ 'O', '0', 'l', '1', 'I' ]
		(0..<length).collect { allChars[ new Random().nextInt( allChars.size() ) ] }.join()
	}
}
