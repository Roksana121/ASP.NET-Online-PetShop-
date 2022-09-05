using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace petShop
{
    public partial class pet_type_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            dsPetTypes.InsertParameters["petType"].DefaultValue = txtPetType.Text;
            dsPetTypes.InsertParameters["housing"].DefaultValue = txtHousing.Text;

            if (dsPetTypes.Insert() > 0)
            {
                txtPetType.Text = "";
                txtHousing.Text = "";
                this.msg.InnerHtml = "Data saved successfully!!!";
                this.alert.Attributes.Add("class", "alert alert-success");
                this.alert.Visible = true;
            }
            else
            {
                this.msg.InnerHtml = "Operation Failed!!!";
                this.alert.Attributes.Add("class", "alert alert-warning");
                this.alert.Visible = true;
            }
        }
    }
}