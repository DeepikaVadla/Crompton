import { LightningElement } from 'lwc';
export default class ArrayCollectionFundamentalsLwc extends LightningElement {
    handlingArrays(event){
        let personName = 'Deepika.V';
        const personNameArray = [' Deepika', ' Sowdhamini', ' Tarak', ' Kalyan', ' Gopi'];

        console.log(''+personNameArray);

        console.log('Data:' +personNameArray);
        console.log('Data Size:' +personNameArray.length);

        //assign multiple values using arrays same like list[] in apex
        const personNameArray2 = new Array('ABC', 'DEF', 'GHI', 'JKL', 'MNO');
        console.log('Data : ' +personNameArray2);
        console.log('Data Size : ' +personNameArray2.length);
        console.log('Get value by using Index from Array : ' +personNameArray2[2]);
        //get index last value
        const indexValue = personNameArray2.length - 4;
        console.log('Get the Index value from Array: ' +personNameArray2[indexValue]);
        
        //get last index value from array while passing value
        console.log('Get the index value from array while passing value: ' +personNameArray2.indexOf('JKL'));
        
        const isAlive = personNameArray2.includes('XYZ'); 
        console.log('check in array by using includes:' +isAlive);

        personNameArray2.push('PQR');
        console.log('data: '+personNameArray2);
        console.log('data size: '+personNameArray2.length);
        
    }
}