// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string journalistName;
        string outlet;
        string ethicsClause;
        string emotionalTag;
        bool summoned;
        bool endorsed;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthics(string memory journalistName, string memory outlet, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(journalistName, outlet, ethicsClause, emotionalTag, true, false, false));
    }

    function confirmEndorsement(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
