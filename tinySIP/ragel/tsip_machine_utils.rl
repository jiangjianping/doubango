/*
* Copyright (C) 2009 Mamadou Diop.
*
* Contact: Mamadou Diop <diopmamadou@yahoo.fr>
*	
* This file is part of Open Source Doubango Framework.
*
* DOUBANGO is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*	
* DOUBANGO is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Lesser General Public License for more details.
*	
* You should have received a copy of the GNU General Public License
* along with DOUBANGO.
*
*/
/**@file tsip_machine_utils.rl
 * @brief Ragel file.
 *
 * @author Mamadou Diop <diopmamadou(at)yahoo.fr>
 *
 * @date Created: Sat Nov 8 16:54:58 2009 mdiop
 */
%%{

	machine tsip_machine_utils;
	
	#OCTET = 0x00..0xff;
	OCTET = "0x"[0-9A-Fa-f]+;
	CHAR = 0x01..0x7f;
	VCHAR = 0x21..0x7e;
	ALPHA = 0x41..0x5a | 0x61..0x7a;
	DIGIT = 0x30..0x39;
	CTL = 0x00..0x1f | 0x7f;
	HTAB = "\t";
	LF = "\n";
	CR = "\r";
	SP = " ";
	DQUOTE = "\"";
	BIT = "0" | "1";
	HEXDIG = DIGIT | "A"i | "B"i | "C"i | "D"i | "E"i | "F"i;
	CRLF = CR LF;
	WSP = SP | HTAB;
	LWSP = ( WSP | ( CRLF WSP ) )*;
	LWS = ( WSP* CRLF )? WSP+;
	SWS = LWS?;
	EQUAL = SWS "=" SWS;
	LHEX = DIGIT | 0x61..0x66;
	HCOLON = ( SP | HTAB )* ":" SWS;
	separators = "(" | ")" | "<" | ">" | "@" | "," | ";" | ":" | "\\" | DQUOTE | "/" | "[" | "]" | "?" | "=" | "{" | "}" | SP | HTAB;
	STAR = SWS "*" SWS;
	SLASH = SWS "/" SWS;
	LPAREN = SWS "(" SWS;
	RPAREN = SWS ")" SWS;
	COMMA = SWS "," SWS;
	SEMI = SWS ";" SWS;
	COLON = SWS ":" SWS;
	LAQUOT = SWS "<";
	RAQUOT = ">" SWS;
	UTF8_CONT = 0x80..0xbf;
	UTF8_NONASCII = ( 0xc0..0xdf UTF8_CONT ) | ( 0xe0..0xef UTF8_CONT{2} ) | ( 0xf0..0xf7 UTF8_CONT{3} ) | ( 0xf8..0xfb UTF8_CONT{4} ) | ( 0xfc..0xfd UTF8_CONT{5} );
	ctext = 0x21..0x27 | 0x2a..0x5b | 0x5d..0x7e | UTF8_NONASCII | LWS;
	qvalue = ( "0" ( "." DIGIT{,3} )? ) | ( "1" ( "." "0"{,3} )? );
	alphanum = ALPHA | DIGIT;
	token = ( alphanum | "-" | "." | "!" | "%" | "*" | "_" | "+" | "`" | "'" | "~" )+;
	token_nodot = ( alphanum | "-" | "!" | "%" | "*" | "_" | "+" | "`" | "'" | "~" )+;
	word = ( alphanum | "-" | "." | "!" | "%" | "*" | "_" | "+" | "`" | "'" | "~" | "(" | ")" | "<" | ">" | ":" | "\\" | DQUOTE | "/" | "[" | "]" | "?" | "{" | "}" )+;
	domainlabel = alphanum | ( alphanum ( alphanum | "-" )* alphanum );
	toplabel = ALPHA | ( ALPHA ( alphanum | "-" )* alphanum );
	hostname = ( domainlabel "." )* toplabel "."?;
	IPv4address = DIGIT{1,3} "." DIGIT{1,3} "." DIGIT{1,3} "." DIGIT{1,3};
	hex4 = HEXDIG{1,4};
	hexseq = hex4 ( ":" hex4 )*;
	hexpart = hexseq | ( hexseq "::" hexseq? ) | ( "::" hexseq? );
	IPv6address = hexpart ( ":" IPv4address )?;
	IPv6reference = "[" IPv6address "]";
	host = hostname | IPv4address | IPv6reference;
	qdtext = LWS | "!" | 0x23..0x5b | 0x5d..0x7e | UTF8_NONASCII;
	quoted_pair = "\\" ( 0x00..0x09 | 0x0b..0x0c | 0x0e..0x7f );
	quoted_string = SWS DQUOTE ( qdtext | quoted_pair )* DQUOTE;
	gen_value = token | host | quoted_string;
	generic_param = token ( EQUAL gen_value )?;
	accept_param = ( "q"i EQUAL qvalue ) | generic_param;
	mark = "-" | "_" | "." | "!" | "~" | "*" | "'" | "(" | ")";
	unreserved = alphanum | mark;
	escaped = "%" HEXDIG HEXDIG;
	user_unreserved = "&" | "=" | "+" | "$" | "," | ";" | "?" | "/";
	user = ( unreserved | escaped | user_unreserved )+;
	visual_separator = "-" | "." | "(" | ")";
	phonedigit = DIGIT | visual_separator?;
	global_number_digits = "+" phonedigit* DIGIT phonedigit*;
	param_unreserved = "[" | "]" | "/" | ":" | "&" | "+" | "$";
	pct_encoded = "%" HEXDIG HEXDIG;
	paramchar = param_unreserved | unreserved | pct_encoded;
	pname = paramchar+;
	pvalue = paramchar+;
	parameter = ";" pname ( "=" pvalue )?;
	extension = ";ext="i phonedigit+;
	reserved = ";" | "/" | "?" | ":" | "@" | "&" | "=" | "+" | "$" | ",";
	uric = reserved | unreserved | escaped;
	isdn_subaddress = ";isub="i uric+;
	not_defined = token;
	global_rn = not_defined;
	hex_phonedigit = HEXDIG | visual_separator;
	domainname = ( domainlabel "." )* toplabel "."?;
	phonedigit_hex = HEXDIG | "*" | "#" | visual_separator?;
	global_hex_digits = "+" phonedigit{1,3} phonedigit_hex*;
	rn_descriptor = domainname | global_hex_digits;
	rn_context = ";rn-context="i rn_descriptor;
	local_rn = hex_phonedigit+ rn_context;
	rn = ";rn="i ( global_rn | local_rn );
	global_cic = global_hex_digits;
	cic_context = ";cic-context="i rn_descriptor;
	local_cic = hex_phonedigit+ cic_context;
	cic = ";cic="i ( global_cic | local_cic );
	npdi = ";npdi"i;
	enum_dip_indicator = ";enumdi"i;
	trunk_group_unreserved = "/" | "&" | "+" | "$";
	trunk_group_label = ( unreserved | escaped | trunk_group_unreserved )+;
	trunk_group = ";tgrp="i trunk_group_label;
	descriptor = domainname | global_number_digits;
	trunk_context = ";trunk-context="i descriptor;
	par = parameter | extension | isdn_subaddress | rn | cic | npdi | enum_dip_indicator | trunk_group | trunk_context;
	global_number = global_number_digits par*;
	local_number_digits = phonedigit_hex* ( HEXDIG | "*" | "#" ) phonedigit_hex*;
	context = ";phone-context="i descriptor;
	local_number = local_number_digits par* context par*;
	telephone_subscriber = global_number | local_number;
	password = ( unreserved | escaped | "&" | "=" | "+" | "$" | "," )*;
	userinfo = ( user | telephone_subscriber ) ( ":" password )? "@";
	port = DIGIT+;
	hostport = host ( ":" port )?;
	other_transport = token;
	transport_param = "transport="i ( "udp"i | "tcp"i | "sctp"i | "tls"i | "tls-sctp"i | other_transport );
	other_user = token;
	user_param = "user="i ( "phone"i | "ip"i | "dialstring"i | other_user );
	ttl = DIGIT{1,3};
	ttl_param = "ttl="i ttl;
	maddr_param = "maddr="i host;
	lr_param = "lr"i;
	option_tag = token;
	other_compression = token;
	compression_param = "comp="i ( "sigcomp"i | other_compression );
	target_param = "target"i EQUAL pvalue;
	orig = "orig"i;
	gr_param = "gr"i ( "=" pvalue )?;
	other_param = pname ( "=" pvalue )?;
	tag_param = "tag"i EQUAL token;
	scheme = ALPHA ( ALPHA | DIGIT | "+" | "-" | "." )*;

	hnv_unreserved = "[" | "]" | "/" | "?" | ":" | "+" | "$";
	hname = ( hnv_unreserved | unreserved | escaped )+;
	hvalue = ( hnv_unreserved | unreserved | escaped )*;
	header = hname ( "=" hvalue )?;
	headers = "?" header ( "&" header )*;
	
	Informational = "100" | "180" | "181" | "182" | "183";
	Success = "200" | "202";
	Redirection = "250" | "301" | "302" | "305" | "380";
	Client_Error = "400" | "401" | "402" | "403" | "404" | "405" | "406" | "407" | "408" | "410" | "412" | "413" | "414" | "415" | "416" | "417" | "420" | "421" | "422" | "423" | "428" | "429" | "433" | "436" | "440" | "437" | "438" | "470" | "480" | "481" | "482" | "483" | "484" | "485" | "486" | "487" | "488" | "489" | "491" | "493" | "494";
	Server_Error = "500" | "501" | "502" | "503" | "504" | "505" | "513" | "580";
	Global_Failure = "600" | "603" | "604" | "606";
	extension_code = DIGIT{3};
	delta_seconds = DIGIT+;
	Status_Code = Informational | Success | Redirection | Client_Error | Server_Error | Global_Failure | extension_code;
	cause_param = "cause"i EQUAL Status_Code;
	
	INVITEm = 0x49.0x4e.0x56.0x49.0x54.0x45;
	ACKm = 0x41.0x43.0x4b;
	OPTIONSm = 0x4f.0x50.0x54.0x49.0x4f.0x4e.0x53;
	BYEm = 0x42.0x59.0x45;
	CANCELm = 0x43.0x41.0x4e.0x43.0x45.0x4c;
	REGISTERm = 0x52.0x45.0x47.0x49.0x53.0x54.0x45.0x52;
	INFOm = 0x49.0x4e.0x46.0x4f;
	PRACKm = 0x50.0x52.0x41.0x43.0x4b;
	SUBSCRIBEm = 0x53.0x55.0x42.0x53.0x43.0x52.0x49.0x42.0x45;
	NOTIFYm = 0x4e.0x4f.0x54.0x49.0x46.0x59;
	UPDATEm = 0x55.0x50.0x44.0x41.0x54.0x45;
	MESSAGEm = 0x4d.0x45.0x53.0x53.0x41.0x47.0x45;
	REFERm = 0x52.0x45.0x46.0x45.0x52;
	PUBLISHm = 0x50.0x55.0x42.0x4c.0x49.0x53.0x48;
	extension_method = token;
	Method = INVITEm | ACKm | OPTIONSm | BYEm | CANCELm | REGISTERm | INFOm | PRACKm | SUBSCRIBEm | NOTIFYm | UPDATEm | MESSAGEm | REFERm | PUBLISHm | extension_method;
	method_param = "method="i Method;

}%%