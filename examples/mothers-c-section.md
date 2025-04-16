### Research Question: *List mothers who received a C-section and their age* 

|Concept| Related Ontology Term/Code |
|----------|-------------|
| Patient  | NCIT_C16960 |
| Birth Date  | NCIT_C68615 |
| Procedure  | NCIT_C25218 |
| Procedure Code (property)  | NCIT_C154626 |
| Cesarean section SNOMED code | http://snomed.info/sct/11466000> 


### SPARQL Query
```
PREFIX : <https://w3id.org/pharmaccess/momcare/datamodel#>
PREFIX bio: <https://w3id.org/biolink/vocab/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ncit: <http://purl.obolibrary.org/obo/>

SELECT ?patient ?birthDate ?procedure ?code
WHERE {
	?patient rdf:type ncit:NCIT_C16960 . #NCIT for Patient
	?patient ncit:NCIT_C68615 ?birthDate . #NCIT for birthDate

	?procedure rdf:type ncit:NCIT_C25218 . #NCIT for Procedure
	?procedure bio:subject ?patient .
	?procedure ncit:NCIT_C154626 ?code . #NCIT for Procedure Code

	FILTER(?code  = <http://snomed.info/sct/11466000>) #SNOMED for Cesarean section
}
```


