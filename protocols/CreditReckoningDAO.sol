// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreditReckoningDAO {
    address public admin;

    struct ReckoningEntry {
        string institution;
        string creditTrigger;
        string exposureAmount;
        string emotionalTag;
        bool summoned;
        bool reinforced;
        bool sealed;
    }

    ReckoningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReckoning(string memory institution, string memory creditTrigger, string memory exposureAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(ReckoningEntry(institution, creditTrigger, exposureAmount, emotionalTag, true, false, false));
    }

    function confirmReinforcement(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function sealReckoningEntry(uint256 index) external onlyAdmin {
        require(entries[index].reinforced, "Must be reinforced first");
        entries[index].sealed = true;
    }

    function getReckoningEntry(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
