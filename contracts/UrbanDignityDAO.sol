// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanDignityDAO {
    address public admin;

    struct DignityAction {
        string city;
        string initiative;
        bool implemented;
    }

    DignityAction[] public actions;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function proposeAction(string memory _city, string memory _initiative) external onlyAdmin {
        actions.push(DignityAction(_city, _initiative, false));
    }

    function markImplemented(uint256 index) external onlyAdmin {
        actions[index].implemented = true;
    }

    function getAction(uint256 index) external view returns (DignityAction memory) {
        return actions[index];
    }
}
