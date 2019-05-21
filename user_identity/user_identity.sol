pragma solidity ^0.4.17;

// User identity verification with blockchains

contract UserExample {

 mapping(address => bool) user_verified;
 mapping(address => bytes32) user_codes;

 mapping(bytes32 => address) to_sign;
 mapping(bytes32 => bool) signed;

 address owner;

 modifier onlyOwner() {
 require(msg.sender == owner);
 _;
 }

 function UserExample() public {
 owner = msg.sender;
 }

// This function will add the user as well as his details to the Ethereum

function addUser(address user, bytes32 hashed_verification) public onlyOwner {
 user_verified[user] = false;
 user_codes[user] = hashed_verification;
 }

 // checks whether or not the user is verified by comparing the hash of the verification code,
 // that the user has provided with the hash that is sent by the admin in the
 
 function verify(bytes32 verification_code) public {
 if (user_verified[msg.sender] == false && 
 sha256(verification_code) == user_codes[msg.sender]) {
 user_verified[msg.sender] = true;
 }
 }
}