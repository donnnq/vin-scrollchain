// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanHousingAccessDAO {
    address public admin;

    struct AccessRequest {
        address applicant;
        string city;
        bool approved;
    }

    AccessRequest[] public requests;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRequest(address _applicant, string memory _city) external {
        requests.push(AccessRequest(_applicant, _city, false));
    }

    function approveRequest(uint256 index) external onlyAdmin {
        requests[index].approved = true;
    }

    function getRequest(uint256 index) external view returns (AccessRequest memory) {
        return requests[index];
    }
}
