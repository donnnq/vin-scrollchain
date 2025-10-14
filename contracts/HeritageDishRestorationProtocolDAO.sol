// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageDishRestorationProtocolDAO {
    address public admin;

    struct Restoration {
        string dishName;
        string origin;
        string restorationMethod;
        bool completed;
    }

    Restoration[] public restorations;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRestoration(string memory _dishName, string memory _origin, string memory _restorationMethod) external onlyAdmin {
        restorations.push(Restoration(_dishName, _origin, _restorationMethod, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        restorations[index].completed = true;
    }

    function getRestoration(uint256 index) external view returns (Restoration memory) {
        return restorations[index];
    }
}
