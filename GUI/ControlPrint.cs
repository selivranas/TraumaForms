using Godot;
using System;
using System.Drawing;
using System.Drawing.Printing;

public class ControlPrint : Control
{
    TextEdit a;
    OptionButton ob;
    // Declare member variables here. Examples:
    // private int a = 2;
    // private string b = "text";

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
        a = (TextEdit) GetNode("RichTextLabel");
        ob = (OptionButton) GetNode("OptionButton");
        ob.AddItem("");
        for (int i = 0; i < PrinterSettings.InstalledPrinters.Count; i++)
        {
            ob.AddItem(PrinterSettings.InstalledPrinters[i]);
        }
            
    }

    public void _on_Print_pressed()
    {
        GD.Print(a.Text);
        if (ob.GetItemText(ob.GetSelectedId()) != "")
        {
            // объект для печати
            PrintDocument printDocument = new PrintDocument();
 
            // обработчик события печати
            printDocument.PrintPage += PrintPageHandler;
 
            PrinterSettings PS = new PrinterSettings();
            PS.PrinterName = ob.GetItemText(ob.GetSelectedId());
            printDocument.PrinterSettings = PS;
            printDocument.Print();
        }
        else
        {
            Label text_button = (Label) GetNode("Print/Label");
            text_button.Text = "Выберите принтер!";
        }
        
    }

    void PrintPageHandler(object sender, PrintPageEventArgs e)
    {
        e.Graphics.DrawString(a.Text, new System.Drawing.Font("Arial", 11), Brushes.Black, 0, 0);
    }   
//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
