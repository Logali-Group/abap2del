@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_YLIBROS_LOG'
@ObjectModel.semanticKey: [ 'IdLibro', 'BiCateg' ]
define root view entity ZC_YLIBROS_LOG
  provider contract transactional_query
  as projection on ZR_YLIBROS_LOG
{
  key IdLibro,
  key BiCateg,
  Titulo,
  Autor,
  Editorial,
  Idioma,
  Paginas,
  Precio,
  Moneda,
  Formato,
  Url,
  LocalLastChangedAt
  
}
