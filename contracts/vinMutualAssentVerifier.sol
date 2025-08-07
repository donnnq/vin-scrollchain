// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinMutualAssentVerifier {
    event AssentDeclared(address indexed party, string role, string message);

    mapping(address => bool) public hasAssented;

    function declareAssent(string memory role, string memory message) external {
        require(!hasAssented[msg.sender], "Already assented.");
        hasAssented[msg.sender] = true;
        emit AssentDeclared(msg.sender, role, message);
    }

    function checkAssent(address party) external view returns (bool) {
        return hasAssented[party];
    }
}
