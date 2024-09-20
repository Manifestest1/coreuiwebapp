import {userState,useEffect, useState} from 'react'

function User(Props)
{
    const students = ['A','B','C','D'];

    students.map((items)=>{
        console.log(items);
    })
    useEffect(()=>{
        console.log('Update Data')
    },[Props.count]);

    return(
        <div>
            <h1>Count Props: {Props.data} </h1>
            {
                 students.map((data)=>
                 <h1>Name: {data}</h1>

                 )
                
            }
           
            <h2>Data Props: {Props.count}</h2>
        </div>
     
    )

}

export default User;