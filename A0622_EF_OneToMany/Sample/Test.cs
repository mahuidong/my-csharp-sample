﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;


namespace A0622_EF_OneToMany.Sample
{
    public class Test
    {

        /// <summary>
        /// 数据库连接地址.
        /// 
        /// 在 Entity Framework 4 当中.
        /// 如果 Initial Catalog 指定的 “数据库”不存在
        /// 那么会在 Data Source 指定的服务器下，自动创建一个。
        /// 
        /// </summary>
        private static readonly string connString =
            @"Data Source=localhost\SQLEXPRESS;Initial Catalog=TestOneToMany;Integrated Security=True";


        MyDbContext context = new MyDbContext(connString);


        /// <summary>
        /// 用于 Linq 处理的数据源.
        /// </summary>
        public IQueryable<School> SchoolDataSource
        {
            get { return context.SchoolDbSet; }
        }

        /// <summary>
        /// 用于 Linq 处理的数据源.
        /// </summary>
        public IQueryable<Teacher> TeacherDataSource
        {
            get { return context.TeacherDbSet; }
        }




        /// <summary>
        /// 保存.
        /// </summary>
        /// <param name="data"></param>
        public void SaveSchoolData(School data)
        {
            if (data.SchoolID == 0)
            {
                context.SchoolDbSet.Add(data);
            }
            else
            {
                context.Entry(data).State = EntityState.Modified;
            }
            context.SaveChanges();
        }



        /// <summary>
        /// 保存.
        /// </summary>
        /// <param name="data"></param>
        public void SaveTeacherData(Teacher data)
        {
            if (data.TeacherID == 0)
            {
                context.TeacherDbSet.Add(data);
            }
            else
            {
                context.Entry(data).State = EntityState.Modified;
            }
            context.SaveChanges();
        }


    }
}
