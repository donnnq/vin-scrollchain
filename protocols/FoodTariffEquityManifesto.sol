// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodTariffEquityManifesto {
    address public admin;

    struct TariffEntry {
        string commodity;
        uint256 proposedRate;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    TariffEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTariff(string memory commodity, uint256 proposedRate, string memory emotionalTag) external onlyAdmin {
        entries.push(TariffEntry(commodity, proposedRate, emotionalTag, true, false, false));
    }

    function ratifyTariff(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealTariff(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTariffEntry(uint256 index) external view returns (TariffEntry memory) {
        return entries[index];
    }
}
