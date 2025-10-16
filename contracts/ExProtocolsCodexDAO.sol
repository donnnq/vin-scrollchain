// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExProtocolsCodexDAO {
    address public admin;

    struct ProtocolEntry {
        string exLabel;
        string protocolClause;
        string emotionalTag;
        bool sealed;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _exLabel, string memory _protocolClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_exLabel, _protocolClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        protocols[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
