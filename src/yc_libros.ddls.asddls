@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'y Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity yc_libros
  as select from    ylibros_log as Libros
    inner join      ycateg_log  as Categoria on Libros.bi_categ = Categoria.bi_categ
    left outer join yc_clnt_lib as Ventas    on Libros.id_libro = Ventas.IdLibro
  association [0..*] to yc_clientes as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
  key Libros.id_libro              as IdLibro,
      Libros.titulo                as Titulo,
      Libros.bi_categ              as Categoria,
      Libros.autor                 as Autor,
      Libros.editorial             as Editorial,
      Libros.idioma                as Idioma,
      Libros.paginas               as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio                as Precio,
      case
        when Ventas.Ventas < 1 then 0
        when Ventas.Ventas = 1 then 1
        when Ventas.Ventas = 2 then 2
        when Ventas.Ventas > 2 then 3
      else 0
      end                          as Ventas,
      case Ventas.Ventas
        when 0 then ''
        else ''
        end                        as Text,
      Libros.moneda                as Moneda,
      Libros.formato               as Formato,
      Libros.url                   as Imagen,
      Categoria.descripcion        as Descripcion,
      Libros.local_created_by      as LocalCreatedBy,
      Libros.local_created_at      as LocalCreatedAt,
      Libros.local_last_changed_by as LocalLastChangedBy,
      Libros.local_last_changed_at as LocalLastChangedAt,
      Libros.last_changed_at       as LastChangedAt,
      _Clientes
}
