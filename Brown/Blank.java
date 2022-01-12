public class Blank {
    
}
public class Blank {

    public static void main(String[] args) {

"<div style='width: 275px; line-height: 12pt;font-weight:bold'>" & IF( 
OR (TEXT( Category__c ) = "Cat_I", TEXT( Category__c ) = "ib") , "CATEGORY I - UNFITTING CONDITIONS:",
IF (TEXT( Category__c ) = "ii" , "CATEGORY II - CONDITIONS THAT CAN BE UNFITTING BUT ARE NOT CURRENTLY UNFITTING:",
"CATEGORY III - CONDITIONS THAT ARE NOT UNFITTING AND NOT COMPENSABLE OR RATABLE:")) & "</div>"

}

}