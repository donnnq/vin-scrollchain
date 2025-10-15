// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EndpointCloakingDAO {
    address public admin;

    struct CloakingEntry {
        string endpointLabel;
        string cloakingMethod;
        string emotionalTag;
        bool hidden;
    }

    CloakingEntry[] public cloaks;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCloak(string memory _endpointLabel, string memory _cloakingMethod, string memory _emotionalTag) external onlyAdmin {
        cloaks.push(CloakingEntry(_endpointLabel, _cloakingMethod, _emotionalTag, false));
    }

    function markHidden(uint256 index) external onlyAdmin {
        cloaks[index].hidden = true;
    }

    function getCloak(uint256 index) external view returns (CloakingEntry memory) {
        return cloaks[index];
    }
}
