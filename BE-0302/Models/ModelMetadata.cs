using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web;

namespace BE_0302.Models
{
    [MetadataType(typeof(CategoryMetadata))]
    public partial class Category { }
    public class CategoryMetadata
    {
        [Required(ErrorMessage = "Vui lòng nhập tên danh mục.")]
        [Display(Name = "Tên danh mục")]
        public string CategoryName { get; set; }
    }

    [MetadataType(typeof(ProductMetadata))]
    public partial class Product
    {
        [NotMapped, Display(Name = "Hình ảnh")]
        public HttpPostedFileBase UploadImg { get; set; }

        [NotMapped]
        public string ImageUrl
        {
            get
            {
                return string.IsNullOrWhiteSpace(ProductImage) || ProductImage.EndsWith("/")
                    ? "~/Content/images/default-product.svg" : ProductImage;
            }
        }
    }
    public class ProductMetadata
    {
        [Range(1, int.MaxValue, ErrorMessage = "Vui lòng chọn danh mục.")]
        [Display(Name = "Danh mục")]
        public int CategoryID { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm.")]
        [Display(Name = "Tên sản phẩm")]
        public string ProductName { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mô tả.")]
        [Display(Name = "Mô tả")]
        public string ProductDecription { get; set; }
        [Range(typeof(decimal), "0", "9999999999999999.99", ErrorMessage = "Đơn giá phải từ 0 đến 9.999.999.999.999.999,99.")]
        [Display(Name = "Đơn giá")]
        public decimal ProductPrice { get; set; }
    }
}
