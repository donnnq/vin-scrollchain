// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegalAidSovereigntyProtocolDAO {
    address public admin;

    struct LawyerProfile {
        string lawyerName;
        string specialization;
        string emotionalTag;
        bool active;
    }

    LawyerProfile[] public profiles;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerLawyer(string memory _lawyerName, string memory _specialization, string memory _emotionalTag) external onlyAdmin {
        profiles.push(LawyerProfile(_lawyerName, _specialization, _emotionalTag, true));
    }

    function deactivateLawyer(uint256 index) external onlyAdmin {
        profiles[index].active = false;
    }

    function getLawyer(uint256 index) external view returns (LawyerProfile memory) {
        return profiles[index];
    }
}
