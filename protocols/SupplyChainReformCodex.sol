// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChainReformCodex {
    address public admin;

    struct ReformEntry {
        string companyName;
        string reformType;
        string region;
        string emotionalTag;
        bool summoned;
        bool implemented;
        bool sealed;
    }

    ReformEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReform(string memory companyName, string memory reformType, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(ReformEntry(companyName, reformType, region, emotionalTag, true, false, false));
    }

    function implementReform(uint256 index) external onlyAdmin {
        entries[index].implemented = true;
    }

    function sealReform(uint256 index) external onlyAdmin {
        require(entries[index].implemented, "Must be implemented first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
