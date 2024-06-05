# Obsidian to Remarkable Automation

This script automates the process of converting Markdown files to PDF and uploading them to a Remarkable tablet. It will watch the specified directory for new or modified files, convert Markdown files to PDF, upload PDFs to Remarkable, and then delete the original files.

## Requirements

- `pandoc`: for converting Markdown to PDF.
- `rmapi`: for uploading files to Remarkable.
- `inotify-tools`: for watching directory changes.

## Installation

1. **Install Dependencies**:
   ```sh
   sudo apt-get update
   sudo apt-get install pandoc inotify-tools
   ```

2. **Install `rmapi`**:
   Follow the instructions on the [rmapi GitHub page](https://github.com/juruen/rmapi) to install `rmapi`.

3. **Set Up `rmapi`**:
   If you are running rmapi for the first time, you need to run `rmapi` once to create the device and user token. Run it with:
   ```sh
   ./rmapi
   ```
   It will ask you to go to [my.remarkable.com](https://my.remarkable.com/) to enter a new activation code.

   You will see a prompt like this where you just need to introduce the activation code:
   ```
   Enter one-time code (go to https://my.remarkable.com/device/desktop/connect):
   ```

4. **Download the Script**:
   Clone this repository and make the script executable:
   ```sh
   git clone https://github.com/imimajin/obsidian-to-remarkable.git
   cd obsidian-to-remarkable
   chmod +x obsidian_to_remarkable.sh
   ```

5. **Configure the Folder Path**:
   Edit the script to set your desired folder path:
   ```sh
   nano obsidian_to_remarkable.sh
   ```
   Change the `REMARKABLE_DIR` variable to your preferred directory:
   ```sh
   REMARKABLE_DIR="$HOME/path/to/your/remarkable/folder"
   ```

6. **Run the Script**:
   ```sh
   nohup ~/obsidian-to-remarkable/obsidian_to_remarkable.sh &
   ```

## Usage

1. **Set Up `rmapi`**:
   Ensure that you have set up `rmapi` as described in the installation steps above.

2. **Copy Files to the Watched Directory**:
   - **Important**: Copy the original Markdown (`.md`) or PDF (`.pdf`) files you want to upload to Remarkable into the specified directory you specified. Do not move the files if you need to keep a local copy.
   - The script will automatically detect new or modified files, convert Markdown files to PDF, and upload all PDFs to your Remarkable device.
   - *Files will be deleted from the directory after successful upload.*

## Contributing

Feel free to fork this repository and submit pull requests. Any improvements or suggestions are welcome!

## License

This project is licensed under the MIT License.
