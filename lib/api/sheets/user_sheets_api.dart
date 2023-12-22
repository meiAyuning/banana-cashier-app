import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  getSheet(sheetName) async {
    const _credentials = r'''
    {
    "type": "service_account",
      "project_id": "gsheets-405102",
      "private_key_id": "f401fba7a898a28314d390331bb52b673b559dde",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDL1dhBC49TSn8K\n/SXtOsz8sRxN0qOv3EE7bPe2XxXAuV+RhEEP5WxPJnV8U7qTgSQK11/mq2RcLs37\nBroxQHHiXLV/U49AGnR4WFbRJWS6JyXosWzGE0ng4sZvAzqSBH5CyW5oDUyjue7n\n9awZQGcHYRuy7AI4rsI1Me6Cg6jzKQVJXcxuLvCrAD4hUtVfmPE79Rwkrd7C/MEK\nA30KGPOSp5Zs4z4ULXZhNVko5AWUGvuLN7f1waSLmbE+FHvShTm0IO8uDROrAqba\nD3u6fVLO+qF/LqBOGuAyRibYI9KDfsAucLp1Zdl32sBTmr+R1amOxLm9zvHa22Kd\no6kxI9zjAgMBAAECggEAWcDoT7/g1OqdJUARxrNZFr1/+o6RL/saqCmTq7STtgCK\nId+r7G13syR6oAuYQKIhNjreygnXD7Y2Ud4E93Hqk6OB8bZgAfiEJ4eydrZx83wQ\nd7VEcbWFluYUPUadMDWVSSA8IsoUYJWbKn1lUdsnYrryQOcmFUJyVo0Nel+x8Ztp\nZACU9ApWuExtboLSKgQOfYAeuSBTQVupU8qLc0EuLCUM8ekOQwhPdetuCFGHBzhV\nGHerWnc4ejlV/wVTGYKULbiyKrOVMuTGrjErxE9HxEsLuvZQZzI5BZrIOSRWxtt9\n3ucSKZzkDpf156crb4YA0Q8EfaFobu3jT+/ioNK2HQKBgQDypffqw5StLNrHyB9q\nfYhWOwdDaSJgYhvldLsFHqNqgCyw8V+JS5ehfm0Ynydx0+7FQT6OkrQCymxD/d8S\nyFF92qXlNGoX4heE7LwiB5FaOFUvJ2Rw2hiiJHujYyvorJw/fN2OBkSN0koJQKPN\nEFG1DoStK8a484HNZ+QvjFOa7QKBgQDXDSSE4bZSJG0nFcOssySsCkvLehRhpJ+z\npUCY+b2VVpB6rIFrmrrCBzQt5J8OI8HhHBSQ+plShaz5fxx+mkuHb5qu9lNTX+bW\nlZz2ulDCn9sxRdRm1xuJYEpSdATF3pUju8gdvea1b4fiRpS3SN+fVAiE//JoUTGL\nirtpXibNDwKBgGIHtWJOQ8m2/miKLE8MikE0NdoBJpdD67tG7qvB1gmX4PZXfd5t\nAMSI3DB/VCNDmQpuMoTNNhaOizDo5u+iqHGtHSq9g0NE33WfYt5oqkuFyLx1MLn7\nEsqm7KB01294FOP9YVEYrSeS1sBoMgUN28THKckAj5d3IXDH0UN4cOp9AoGBAKQV\nxhiR9EAmxRY+eAgMxF10mbKO2oBKUQSMgYZ3f90zqJfBihplfDxRrNGbkHUEeYle\nmJ6qZ1Rc5MeV4lMDPcAAOuFm19tU4Fg43gQv0zE9Mc0dv9wcI0mlq+/P0Fh95gPW\n4vE2lZM4n1Dak9xpgR8bykhY1kgcM5aKa0cRbL+nAoGAG6ogm8pFfS+tiIIyxq2K\nW3XzcqkRC9CU1MaBjvOgkKYzFsT3e9aevXRniT9XLokfVfjlohsNEsuzla7E0tYo\npQb5oo1MJ+Ipg6yrcK5sbtCKnDaAeHz9H55FSqFEtzS6TO22QKASVIVL8ZkzPqrr\nXRI3Wuvaq66MrEMHPoJGLPU=\n-----END PRIVATE KEY-----\n",
      "client_email": "gsheets@gsheets-405102.iam.gserviceaccount.com",
      "client_id": "101743089043058324359",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-405102.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    }
    ''';
    const _spreadsheetId = '1eFkTn6RbYi1REYHIUvQ8pE9H1EFsvRcArrBsm6yBr_A';
    // init GSheets
    final gsheets = GSheets(_credentials);
    // fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    // get worksheet by its title
    final sheet = await ss.worksheetByTitle(sheetName);
    final data = await sheet?.values.allRows();
    return data;
  }
}
