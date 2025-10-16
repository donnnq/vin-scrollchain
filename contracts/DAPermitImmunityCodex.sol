// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAPermitImmunityCodex {
    address public admin;

    struct PermitRequest {
        string requesterLabel;
        string commodity;
        string volume;
        string emotionalTag;
        bool granted;
        bool flagged;
    }

    PermitRequest[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRequest(string memory requesterLabel, string memory commodity, string memory volume, string memory emotionalTag) external onlyAdmin {
        entries.push(PermitRequest(requesterLabel, commodity, volume, emotionalTag, false, false));
    }

    function grantPermit(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function flagRequest(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getRequest(uint256 index) external view returns (PermitRequest memory) {
        return entries[index];
    }
}
