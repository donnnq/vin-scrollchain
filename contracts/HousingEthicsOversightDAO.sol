// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HousingEthicsOversightDAO {
    address public admin;

    struct Complaint {
        address complainant;
        string developer;
        string issue;
        bool resolved;
    }

    Complaint[] public complaints;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileComplaint(address _complainant, string memory _developer, string memory _issue) external {
        complaints.push(Complaint(_complainant, _developer, _issue, false));
    }

    function resolveComplaint(uint256 index) external onlyAdmin {
        complaints[index].resolved = true;
    }

    function getComplaint(uint256 index) external view returns (Complaint memory) {
        return complaints[index];
    }
}
