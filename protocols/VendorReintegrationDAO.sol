// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorReintegrationDAO {
    address public admin;

    struct ReintegrationEntry {
        string district;
        string vendorType;
        string reintegrationClause;
        string emotionalTag;
        bool summoned;
        bool supported;
        bool sealed;
    }

    ReintegrationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReintegration(string memory district, string memory vendorType, string memory reintegrationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReintegrationEntry(district, vendorType, reintegrationClause, emotionalTag, true, false, false));
    }

    function confirmSupport(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function sealReintegrationEntry(uint256 index) external onlyAdmin {
        require(entries[index].supported, "Must be supported first");
        entries[index].sealed = true;
    }

    function getReintegrationEntry(uint256 index) external view returns (ReintegrationEntry memory) {
        return entries[index];
    }
}
