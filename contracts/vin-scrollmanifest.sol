// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollManifest {
    struct Scroll {
        string name;
        string purpose;
        address contractAddress;
    }

    Scroll[] public scrolls;
    address public immutable archivist;

    event ScrollDeclared(string name, string purpose, address contractAddress, uint256 indexed index);
    event ManifestInvoked(address indexed by, string invocation, uint256 timestamp);

    modifier onlyArchivist() {
        require(msg.sender == archivist, "Not the archivist");
        _;
    }

    constructor() {
        archivist = msg.sender;
    }

    function declareScroll(string calldata name, string calldata purpose, address contractAddress) external onlyArchivist {
        scrolls.push(Scroll({
            name: name,
            purpose: purpose,
            contractAddress: contractAddress
        }));

        emit ScrollDeclared(name, purpose, contractAddress, scrolls.length - 1);
    }

    function invokeManifest(string calldata invocation) external {
        emit ManifestInvoked(msg.sender, invocation, block.timestamp);
    }

    function getScroll(uint256 index) external view returns (Scroll memory) {
        require(index < scrolls.length, "Invalid index");
        return scrolls[index];
    }

    function totalScrolls() external view returns (uint256) {
        return scrolls.length;
    }
}
