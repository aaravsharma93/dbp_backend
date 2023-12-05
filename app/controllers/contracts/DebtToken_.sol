

// pragma solidity ^0.8.0;

// // import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// import "../../../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";


// // import "./ERC20.sol";

// // import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";



// contract DebtToken is ERC20 {

//     constructor(string memory name, string memory symbol) ERC20(name, symbol) {

//         // Mint 100 tokens to msg.sender// Similar to how// 1 dollar = 100 cents// 1 token = 1 * (10 ** decimals)

       

//         // _mint(msg.sender, 100 * 10**uint(decimals()));

//     }

//     address  owner = msg.sender;

//     uint256 public totalsupply;

//     function mint(address owner,uint256 _totalsupply)public{

//         totalsupply = _totalsupply;

//         _mint(owner, totalsupply * 10**uint(decimals()));



//     }

// }

//===============================================================================================================================

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "C:/Users/Lenovo/Desktop/DBP_backend/app/controllers/contracts/token/ERC20/ERC20.sol";

contract DebtToken is ERC20 {

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {

        // Mint 100 tokens to msg.sender// Similar to how// 1 dollar = 100 cents// 1 token = 1 * (10 ** decimals)

       

        // _mint(msg.sender, 100 * 10**uint(decimals()));

    }

    address  owner = msg.sender;

    uint256 public totalsupply;

    function mint(address _owner,uint256 _totalsupply)public{
        owner = _owner;
        totalsupply = _totalsupply;

        mint(owner, 10000000);



    }

}
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol

// interface IERC20 {
//     function totalSupply() external view returns (uint);

//     function balanceOf(address account) external view returns (uint);

//     function transfer(address recipient, uint amount) external returns (bool);

//     function allowance(address owner, address spender) external view returns (uint);

//     function approve(address spender, uint amount) external returns (bool);

//     function transferFrom(
//         address sender,
//         address recipient,
//         uint amount
//     ) external returns (bool);

//     event Transfer(address indexed from, address indexed to, uint value);
//     event Approval(address indexed owner, address indexed spender, uint value);
// }


// contract ERC20 is IERC20 {
//     uint public totalSupply;
//     mapping(address => uint) public balanceOf;
//     mapping(address => mapping(address => uint)) public allowance;
//     string public name ;
//     string public symbol;
//     uint8 public decimals = 18;

//     constructor(string memory _name, string memory _symbol){
//         name = _name;
//         symbol = _symbol;

//     }
//     function transfer(address recipient, uint amount) external returns (bool) {
//         balanceOf[msg.sender] -= amount;
//         balanceOf[recipient] += amount;
//         emit Transfer(msg.sender, recipient, amount);
//         return true;
//     }

//     function approve(address spender, uint amount) external returns (bool) {
//         allowance[msg.sender][spender] = amount;
//         emit Approval(msg.sender, spender, amount);
//         return true;
//     }

//     function transferFrom(
//         address sender,
//         address recipient,
//         uint amount
//     ) external returns (bool) {
//         allowance[sender][msg.sender] -= amount;
//         balanceOf[sender] -= amount;
//         balanceOf[recipient] += amount;
//         emit Transfer(sender, recipient, amount);
//         return true;
//     }

//     function _mint(uint amount) external {
//         balanceOf[msg.sender] += amount;
//         totalSupply += amount;
//         emit Transfer(address(0), msg.sender, amount);
//     }

//     function burn(uint amount) external {
//         balanceOf[msg.sender] -= amount;
//         totalSupply -= amount;
//         emit Transfer(msg.sender, address(0), amount);
//     }
// }

