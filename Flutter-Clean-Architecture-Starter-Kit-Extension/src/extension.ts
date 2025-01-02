
import * as vscode from 'vscode';
import * as fs from 'fs';
import * as path from 'path';

export function activate(context: vscode.ExtensionContext) {
   
    const createFeatureCommand = vscode.commands.registerCommand('extension.setupCleanArch', async () => {
        const workspaceFolders = vscode.workspace.workspaceFolders;
        if (!workspaceFolders) {
            vscode.window.showErrorMessage('Please open a Flutter project folder.');
            return;
        }

        const projectPath = workspaceFolders[0].uri.fsPath;
        const libPath = path.join(projectPath, 'lib');

        if (!fs.existsSync(libPath)) {
            fs.mkdirSync(libPath);
        }

        const corePath = path.join(libPath, 'core');
        const featuresPath = path.join(libPath, 'features');

        try {
            const templateCorePath = path.join(context.extensionPath, 'template', 'core');
            const templateFeaturesPath = path.join(context.extensionPath, 'template', 'features');

            if (!fs.existsSync(templateCorePath) || !fs.existsSync(templateFeaturesPath)) {
                vscode.window.showErrorMessage('Template files are missing in the extension package.');
                return;
            }

            copyFolder(templateCorePath, corePath);

            const featureName = await vscode.window.showInputBox({ prompt: 'Enter the name of the new feature' });
            if (!featureName) {
                return; 
            }

            if (!fs.existsSync(featuresPath)) {
                fs.mkdirSync(featuresPath, { recursive: true });
            }

            const featurePath = path.join(featuresPath, featureName);

            if (!fs.existsSync(featurePath)) {
                fs.mkdirSync(featurePath, { recursive: true });
                copyFolder(templateFeaturesPath, featurePath);

                vscode.window.showInformationMessage(`Feature "${featureName}" created successfully.`);

                await revealFolderInExplorer(featurePath);

            } else {
                vscode.window.showErrorMessage(`Feature "${featureName}" already exists.`);
            }

        } catch (error) {
            vscode.window.showErrorMessage(`Error setting up architecture: ${error}`);
        }
    });

 
    const removeFeatureCommand = vscode.commands.registerCommand('extension.removeCleanArchFeature', async () => {
        const workspaceFolders = vscode.workspace.workspaceFolders;
        if (!workspaceFolders) {
            vscode.window.showErrorMessage('Please open a Flutter project folder.');
            return;
        }

        const projectPath = workspaceFolders[0].uri.fsPath;
        const featuresPath = path.join(projectPath, 'lib', 'features');

        if (!fs.existsSync(featuresPath)) {
            vscode.window.showErrorMessage('No "features" folder found in the project.');
            return;
        }

        const featureName = await vscode.window.showInputBox({ prompt: 'Enter the name of the feature to remove' });
        if (!featureName) {
            return; 
        }

        const featurePath = path.join(featuresPath, featureName);

        if (!fs.existsSync(featurePath)) {
            vscode.window.showErrorMessage(`Feature "${featureName}" does not exist.`);
            return;
        }

        const confirmation = await vscode.window.showQuickPick(['Yes', 'No'], {
            placeHolder: `Are you sure you want to remove feature "${featureName}"?`
        });

        if (confirmation !== 'Yes') {
            vscode.window.showInformationMessage(`Feature "${featureName}" removal canceled.`);
            return;
        }

        fs.rmdirSync(featurePath, { recursive: true });
        vscode.window.showInformationMessage(`Feature "${featureName}" removed successfully.`);
    });

    context.subscriptions.push(createFeatureCommand, removeFeatureCommand);
}


function copyFolder(source: string, destination: string) {
    if (!fs.existsSync(destination)) {
        fs.mkdirSync(destination, { recursive: true });
    }

    const files = fs.readdirSync(source);
    for (const file of files) {
        const srcPath = path.join(source, file);
        const destPath = path.join(destination, file);

        if (fs.lstatSync(srcPath).isDirectory()) {
            copyFolder(srcPath, destPath);
        } else {
            fs.copyFileSync(srcPath, destPath);
        }
    }
}


async function revealFolderInExplorer(folderPath: string) {
    try {
        await vscode.commands.executeCommand('workbench.view.explorer');

        
        const tempFilePath = path.join(folderPath, 'Readme.md');

        if (!fs.existsSync(tempFilePath)) {
            fs.writeFileSync(tempFilePath, '');
        }

        const doc = await vscode.workspace.openTextDocument(tempFilePath);
        const editor = await vscode.window.showTextDocument(doc, { preview: true });

        await vscode.commands.executeCommand('workbench.files.action.showActiveFileInExplorer');

        await vscode.commands.executeCommand('workbench.action.closeActiveEditor');

    

    } catch (error) {
        vscode.window.showErrorMessage(`Error revealing folder: ${error}`);
    }
}

export function deactivate() {}
