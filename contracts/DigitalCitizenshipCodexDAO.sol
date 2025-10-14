// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalCitizenshipCodexDAO {
    address public admin;

    struct CitizenshipClaim {
        string individualID;
        string digitalOrigin;
        string rightsGranted;
        string emotionalTag;
        bool approved;
    }

    CitizenshipClaim[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClaim(string memory _individualID, string memory _digitalOrigin, string memory _rightsGranted, string memory _emotionalTag) external onlyAdmin {
        codex.push(CitizenshipClaim(_individualID, _digitalOrigin, _rightsGranted, _emotionalTag, false));
    }

    function approveClaim(uint256 index) external onlyAdmin {
        codex[index].approved = true;
    }

    function getClaim(uint256 index) external view returns (CitizenshipClaim memory) {
        return codex[index];
    }
}
