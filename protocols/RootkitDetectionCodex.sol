// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RootkitDetectionCodex {
    address public admin;

    struct RootkitEntry {
        string payloadName;
        string deviceModel;
        string persistenceType;
        string emotionalTag;
        bool summoned;
        bool detected;
        bool sealed;
    }

    RootkitEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRootkit(string memory payloadName, string memory deviceModel, string memory persistenceType, string memory emotionalTag) external onlyAdmin {
        entries.push(RootkitEntry(payloadName, deviceModel, persistenceType, emotionalTag, true, false, false));
    }

    function confirmDetection(uint256 index) external onlyAdmin {
        entries[index].detected = true;
    }

    function sealRootkit(uint256 index) external onlyAdmin {
        require(entries[index].detected, "Must be detected first");
        entries[index].sealed = true;
    }

    function getRootkitEntry(uint256 index) external view returns (RootkitEntry memory) {
        return entries[index];
    }
}
