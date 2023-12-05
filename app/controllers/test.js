// const HDWalletProvider = require('truffle-hdwallet-provider');
const path = require('path');
const fs = require('fs-extra')
const solc = require('solc');

const ERC20code = fs.readFileSync("C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/token/ERC20/ERC20.sol");
const IERC20code = fs.readFileSync("C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/token/ERC20/IERC20.sol");
const IERC20Metadatacode = fs.readFileSync("C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/token/ERC20/extensions/IERC20Metadata.sol");
const Contextcode = fs.readFileSync("C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/utils/Context.sol");


// const buildPath = path.resolve(__dirname, "builds");
// fs.removeSync(buildPath);
      
        const inboxpath = path.resolve(__dirname,'Contracts','DebtToken.sol');
        console.log("inboxpath",inboxpath);
        const source = fs.readFileSync(inboxpath, 'UTF-8');
        // fs.ensureDirSync(buildPath);
        console.log("__dirname",__dirname);
        const input = {
        language: "Solidity",
        sources: {
            'DebtToken.sol': {
                content: source
            }
        },
        settings: {
            optimizer:{
                enabled:true
            },
            outputSelection: {
                '*': {
                    '*': [ '*' ]
                }
            }
        }
        };

        function findImports(path) {
            // if (path === "./DebtToken") return {contents: `${DebtToken}`};
            if (path === "C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/token/ERC20/ERC20.sol") return { contents: `${ERC20code}` };
            if (path === "C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/token/ERC20/IERC20.sol") return { contents: `${IERC20code}` };
            if (path === "C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/token/ERC20/extensions/IERC20Metadata.sol") return { contents: `${IERC20Metadatacode}`};
            if (path === "C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/utils/Context.sol") return { contents: `${Contextcode}` };
            else return { error: "File not found" };
          }

        
        const output = JSON.parse(solc.compile(JSON.stringify(input),{ import: findImports }));
        console.log("here is output",output);

        const contractFile = output.contracts['DebtToken.sol']['DebtToken'];
        console.log("2")

        //deploye script
        const bytecode =  contractFile.evm.bytecode.object;
        const abi = contractFile.abi;
        // console.log("1",output)
       
        // console.log("2")

        //deploye script
        // const bytecode =  contractFile.evm.bytecode.object;
        // const abi = contractFile.abi;
        // // console.log(abi);
        console.log("ABI",abi);
        console.log("Bytecode",bytecode);
        // return [bytecode,abi]
// }
        
// compileContract(["./contracts", "DebtToken.sol"]);
// compileContract(["./", "UniswapV2Factory.sol"]);
// compileContract(["./", "UniswapV2Pair.sol"]);
// compileContract(["./", "UniswapV2ERC20.sol"]);
// compileContract(["./", "libraries", "Math.sol"]);
// compileContract(["./", "libraries", "SafeMath.sol"]);
// compileContract(["./", "libraries", "UQ112x112.sol"]);
// compileContract(["./", "interfaces", "IUniswapV2Factory.sol"]);
// compileContract(["./", "interfaces", "IERC20.sol"]);
// compileContract(["./", "interfaces", "IUniswapV2Callee.sol"]);
// compileContract(["./", "interfaces", "IUniswapV2ERC20.sol"]);
// compileContract(["./", "interfaces", "IUniswapV2Pair.sol"]);
