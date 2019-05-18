# TimeRegister

A little elixir program to update time registers in a google drive spreadsheet

## Installation
If you're a developer and clone the repo, you can use mix to install dependencies and then build and install the executable.
```
$ mix deps.get
$ MIX_ENV=prod mix escript.build
$ MIX_ENV=prod mix escript.install
```
By default, escript executables are installed in ~/.mix/escripts, so you have to add this folder to your path. Otherwise, you can copy the executable in a folder already added to the path, like /usr/local/bin

NOTE: An escript is an executable that can be invoked from the command line. An escript can run on any machine that has Erlang/OTP installed and by default does not require Elixir to be installed, as Elixir is embedded as part of the escript.

## Configuration
Follow this steps to create and configure a project in Google Developers Console (extracted from https://github.com/Voronchuk/elixir_google_spreadsheets, the best explanation I've found so far, thx Voronchuk)

1. Use [this](https://console.developers.google.com/start/api?id=sheets.googleapis.com) wizard to create or select a project in the Google Developers Console and automatically turn on the API. Click __Continue__, then __Go to credentials__.
2. On the __Add credentials to your project page__, create __Service account key__.
3. Select your project name as service account and __JSON__ as key format, download the created key and rename it to __service_account.json__.
4. Press __Manage service accounts__ on a credential page, copy your __Service Account Identifier__: _[projectname]@[domain].iam.gserviceaccount.com_

Create or open existing __Google Spreadsheet document__ on your __Google Drive__ and add __Service Account Identifier__ as user invited in spreadsheet's __Collaboration Settings__.

Put your service_account.json in ~/.time_register folder

Finally, in the same folder, create a settings json file with general configuration and secrets.
```json
{
  "spreadsheet_url": "XXXXXXXXXXXXXXXXXXXXXXXXXXX-XXXXXXXXXXXXXXXX",
  "first_row": 0,
  "columns_to_update": 0
}
```
spreadsheet_url: spreadsheet id from url

header_rows: number of header rows to skip (1 in sheet example below)

columns_to_update: columns to be updated in every month day row (5 in sheet example below)

Time registers sheet example
```
1 | month day | morning start | afternoon start | morning end | afternoon end
2 |     1     |               |                 |             |
3 |     2     |               |                 |             |
```

## Usage
```elixir
time_register -i|--item <item>
```

item: It's one of: sm (start at morning); em (end at morning); sa (start at afternoon); ea (end at afternoon)

## Notes
Use of tzdata version ~>0.1.8 is needed for escript building (see https://github.com/bitwalker/timex/issues/86)
