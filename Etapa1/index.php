<?php

include 'aux.php';

$html = file_get_contents('http://www.jb.com.br');

$jbBR = new DOMDocument();
$i=-1;

libxml_use_internal_errors(TRUE); //disable libxml errors

if(!empty($html)){

  $jbBR->loadHTML($html);
  libxml_clear_errors(); //remove errors from html
  $jbBR_xpath = new DOMXPath($jbBR);
  $jbBR_row = $jbBR_xpath->query('//h2//a//@href');
  $titulos = $jbBR_xpath->query('//h2');

  $xmlstr = "<?xml version='1.0' encoding='UTF-8'?><jb/>";
  $jbXML = new SimpleXMLElement($xmlstr);

  if($jbBR_row->length > 0){
      foreach($jbBR_row as $row){
          $i++;
          $new = $row->nodeValue;
          $htmlNovo = file_get_contents("http://www.jb.com.br".$new);
          $jbBRNovo = new DOMDocument();

          if(!empty($htmlNovo)){

              $jbBRNovo->loadHTML($htmlNovo);
              libxml_clear_errors();
              
              $jbBR_xpathNovo = new DOMXPath($jbBRNovo);

              $titulosNovo = $jbBR_xpathNovo->query("//div[@id='HOTWordsTxt']//p");

              if($titulosNovo->length == 0){

                if(($new[0] == '/') && ($new[1] == 'i') && ($new!="/sociedade-aberta/") && ($new!="/colunistas/")){
                    for($c=1;$c<=73;$c++){
                      echo "<br/> section -> http://www.jb.com.br".$new."noticias/pagina/".$c."/<br/>";
                      otherSections(("http://www.jb.com.br".$new."noticias/pagina/".$c."/"),$jbXML);
                    }
                    
                }
              }
          }
      }
  }
  $jbXML->asXML('jb.xml');
}
?>