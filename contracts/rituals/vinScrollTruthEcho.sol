// SPDX-License-Identifier: ReputationEcho
pragma solidity ^0.8.0;

contract vinScrollTruthEcho {
    address public scrollLord;
    mapping(address => string[]) public echoLog;

    event ReputationEchoed(address indexed violator, string echo);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Scroll Echo unauthorized.");
        _;
    }

    function emitEcho(address violator, string memory echoMessage) public onlyScrollLord {
        echoLog[violator].push(echoMessage);
        emit ReputationEchoed(violator, echoMessage);
    }

    function retrieveEcho(address violator) public view returns (string[] memory) {
        return echoLog[violator];
    }
}
