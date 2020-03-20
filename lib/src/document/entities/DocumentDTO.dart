class DocumentDTO {

  final String id;
  final String rbf;

  DocumentDTO( this.id, this.rbf );

  DocumentDTO.fromJson( Map<String, dynamic> json ):
    this.id = json[ 'id' ],
    this.rbf = json[ 'rbf' ];

  Map<String, dynamic> toJson() =>
  {
    'id'  : this.id,
    'rbf' : this.rbf
  };

}