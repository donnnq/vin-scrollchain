// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegacyOwnerReintegrationDAO {
    address public admin;

    struct OwnerEntry {
        string ownerName;
        string factoryName;
        string reintegrationClause;
        string emotionalTag;
        bool onboarded;
    }

    OwnerEntry[] public owners;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitOwner(string memory _ownerName, string memory _factoryName, string memory _reintegrationClause, string memory _emotionalTag) external onlyAdmin {
        owners.push(OwnerEntry(_ownerName, _factoryName, _reintegrationClause, _emotionalTag, false));
    }

    function markOnboarded(uint256 index) external onlyAdmin {
        owners[index].onboarded = true;
    }

    function getOwner(uint256 index) external view returns (OwnerEntry memory) {
        return owners[index];
    }
}
