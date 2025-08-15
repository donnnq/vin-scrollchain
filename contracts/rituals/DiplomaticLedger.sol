// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaticLedger {
    address public steward;

    struct Declaration {
        string title;
        string description;
        string target;
        bool isSupport;
        uint timestamp;
    }

    Declaration[] public declarations;

    event DeclarationLogged(string title, string target, bool isSupport, uint timestamp);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can modify ledger.");
        _;
    }

    function logDeclaration(
        string memory title,
        string memory description,
        string memory target,
        bool isSupport
    ) public onlySteward {
        declarations.push(Declaration({
            title: title,
            description: description,
            target: target,
            isSupport: isSupport,
            timestamp: block.timestamp
        }));

        emit DeclarationLogged(title, target, isSupport, block.timestamp);
    }

    function getDeclaration(uint index) public view returns (
        string memory title,
        string memory description,
        string memory target,
        bool isSupport,
        uint timestamp
    ) {
        Declaration memory d = declarations[index];
        return (d.title, d.description, d.target, d.isSupport, d.timestamp);
    }

    function totalDeclarations() public view returns (uint) {
        return declarations.length;
    }
}
