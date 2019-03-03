using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RAWunited.classes
{
    public class Item
    {
        public string title { get; set; }
        public string category { get; set; }
        public string desc { get; set; }
        public string[] picturesPath { get; set; }
        public Item(string title, string category, string desc, string[] picturesPath)
        {
            this.title = title;
            this.category = category;
            this.desc = desc;
            this.picturesPath = picturesPath;
        }
    }
}