[QueryItem="Mothers who received a C-section"]
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
[QueryItem="Patients diagnosed with hypertension during their pregnancy"]
PREFIX : <https://w3id.org/pharmaccess/momcare/datamodel#>
PREFIX bio: <https://w3id.org/biolink/vocab/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX ncit: <http://purl.obolibrary.org/obo/>

SELECT ?patient ?birthDate ?condition ?code
WHERE {
	?patient rdf:type ncit:NCIT_C16960 . #NCIT for Patient
	?patient ncit:NCIT_C68615 ?birthDate . #NCIT for birthDate

	?condition rdf:type ncit:NCIT_C25164 . #NCIT for Condition
	?condition bio:subject ?patient .
	?condition ncit:NCIT_C93536 ?code . #NCIT for Procedure Code

	FILTER(CONTAINS(STR(?code), "O13")) #ICD 10 codes
}