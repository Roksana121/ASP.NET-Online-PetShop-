using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace petShop
{
    public partial class pet_Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if(!picture.HasFile || picture.PostedFile.ContentLength <= 0)
            {
                this.msg.InnerHtml = "Select at least one picture for the pet";
                this.alert.Attributes.Add("class", "alert alert-warning");
                this.alert.Visible = true;
                return;
            }
            if (picture.HasFile)
            {
                if (picture.PostedFile.ContentLength > 0)
                {
                    picture.PostedFile.SaveAs(Server.MapPath("~/Images/") + picture.FileName);
                }
            }
            dsPets.InsertParameters["typeId"].DefaultValue = ddlPetType.SelectedValue;
            dsPets.InsertParameters["colorDescription"].DefaultValue = txtColor.Text;
            dsPets.InsertParameters["sellUnitDescription"].DefaultValue = txtDescription.Text;
            dsPets.InsertParameters["price"].DefaultValue = txtSellPrice.Text;
            dsPets.InsertParameters["picture"].DefaultValue = picture.FileName;

            if (dsPets.Insert() > 0)
            {
                ddlPetType.SelectedIndex = -1;
                txtColor.Text = "";
                txtDescription.Text = "";
                txtSellPrice.Text = "";
                this.msg.InnerHtml = "Data Inserted Successfully!!!";
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