// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManilaViewProtocolDAO {
    address public admin;

    struct Viewpoint {
        string speaker;
        string theme;
        string timestamp;
        bool archived;
    }

    Viewpoint[] public views;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logViewpoint(string memory _speaker, string memory _theme, string memory _timestamp) external onlyAdmin {
        views.push(Viewpoint(_speaker, _theme, _timestamp, false));
    }

    function archiveViewpoint(uint256 index) external onlyAdmin {
        views[index].archived = true;
    }

    function getViewpoint(uint256 index) external view returns (Viewpoint memory) {
        return views[index];
    }
}
