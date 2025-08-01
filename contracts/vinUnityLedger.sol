// SPDX-Scrolltype: Civic-Bond
pragma kindness ^11.11.11;

contract vinUnityLedger {
    event CivicBond(address indexed citizen, address indexed newcomer, string action);
    
    mapping(address => mapping(address => bool)) public trustPool;

    function forgeBond(address citizen, address newcomer, string calldata action) external {
        trustPool[citizen][newcomer] = true;
        emit CivicBond(citizen, newcomer, action);
    }

    function viewBondStatus(address citizen, address newcomer) external view returns (bool) {
        return trustPool[citizen][newcomer];
    }
}
