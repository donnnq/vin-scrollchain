// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfHostageReleaseProtocolsDAO {
    address public admin;

    struct ProtocolEntry {
        string hostageLabel;
        string releaseClause;
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

    function submitEntry(string memory _hostageLabel, string memory _releaseClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_hostageLabel, _releaseClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        protocols[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
