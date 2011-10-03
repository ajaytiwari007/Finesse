class IndianName

   def generate_name
    name_1=["Ram","Krishn","Neel","Raj","Indra","Dev","Shri","Ashwin","Rajni","Hem","Surya","chandra"]
    name_2=["kamal","kant","anand","Kumar","nathan","narayan","mohan","shekhar","bhushan","prakash","nath","manohar","nandan",""]
    name_3=["Gupta","Singh","Jain","More","Tiwari","Lahiri","Bhattacharya","Shah","Yadav","Joshi","Mahajan","Mehta","Thakkar","Rao","Desai","Kulkarni","Pandit","Patel","Reddy","Sharma","Iyer"]
    (name_1[rand(name_1.length)]+name_2[rand(name_2.length)]+" "+name_3[rand(name_3.length)])
   end

end