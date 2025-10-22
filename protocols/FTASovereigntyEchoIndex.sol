// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FTASovereigntyEchoIndex {
    address public admin;

    struct EchoEntry {
        string country; // "Philippines"
        string FTAPartner; // "EU", "Canada", "Chile"
        string echoType; // "Economic boost", "Tariff shield"
        string emotionalTag;
        bool echoed;
        bool sealed;
    }

    EchoEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logEcho(string memory country, string memory FTAPartner, string memory echoType, string memory emotionalTag) external onlyAdmin {
        entries.push(EchoEntry(country, FTAPartner, echoType, emotionalTag, true, false));
    }

    function sealEchoEntry(uint256 index) external onlyAdmin {
        require(entries[index].echoed, "Must be echoed first");
        entries[index].sealed = true;
    }

    function getEchoEntry(uint256 index) external view returns (EchoEntry memory) {
        return entries[index];
    }
}
