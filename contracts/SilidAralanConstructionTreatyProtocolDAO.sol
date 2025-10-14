// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SilidAralanConstructionTreatyProtocolDAO {
    address public admin;

    struct TreatyEntry {
        string region;
        uint256 classroomCount;
        uint256 allocatedBudget;
        string emotionalTag;
        bool sealed;
    }

    TreatyEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _region, uint256 _classroomCount, uint256 _allocatedBudget, string memory _emotionalTag) external onlyAdmin {
        protocols.push(TreatyEntry(_region, _classroomCount, _allocatedBudget, _emotionalTag, false));
    }

    function sealTreaty(uint256 index) external onlyAdmin {
        protocols[index].sealed = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return protocols[index];
    }
}
