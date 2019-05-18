# TimeRegister

A script to update time registers in a google drive spreadsheet

## Configuration
Follow this steps to create and configure a project in Google Developers Console (extracted from https://github.com/Voronchuk/elixir_google_spreadsheets, the best explanation I've found so far, thx Voronchuk)

1. Use [this](https://console.developers.google.com/start/api?id=sheets.googleapis.com) wizard to create or select a project in the Google Developers Console and automatically turn on the API. Click __Continue__, then __Go to credentials__.
2. On the __Add credentials to your project page__, create __Service account key__.
3. Select your project name as service account and __JSON__ as key format, download the created key and rename it to __service_account.json__.
4. Press __Manage service accounts__ on a credential page, copy your __Service Account Identifier__: _[projectname]@[domain].iam.gserviceaccount.com_

Create or open existing __Google Spreadsheet document__ on your __Google Drive__ and add __Service Account Identifier__ as user invited in spreadsheet's __Collaboration Settings__.

Put your service_account.json in ~/.time_register folder

## Usage
```elixir
./time_register <item>
```

item: It's one of: sm (start at morning); em (end at morning); sa (start at afternoon); ea (end at afternoon)

## Notes
Use of tzdata version ~>0.1.8 is needed for escript building (see https://github.com/bitwalker/timex/issues/86)
