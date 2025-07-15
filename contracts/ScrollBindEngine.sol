// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollBindEngine {
    struct BindInfo {
        address user;
        string uid;
        bool isBound;
        uint256 timestamp;
    }

    mapping(address => BindInfo) public bindings;

    event Bound(address indexed user, string uid);
    event Unbound(address indexed user);

    /// @notice Bind your wallet to a unique UID (e.g. ML account)
    function bindAccount(string calldata uid) external {
        require(!bindings[msg.sender].isBound, "Already bound");
        bindings[msg.sender] = BindInfo({
            user: msg.sender,
            uid: uid,
            isBound: true,
            timestamp: block.timestamp
        });
        emit Bound(msg.sender, uid);
    }

    /// @notice Check whether an address is bound
    function getBindStatus(address user) external view returns (bool) {
        return bindings[user].isBound;
    }

    /// @notice Retrieve full bind details for a user
    function getBindInfo(address user) 
        external 
        view 
        returns (
            address boundUser, 
            string memory uid, 
            bool bound, 
            uint256 time
        ) 
    {
        BindInfo storage info = bindings[user];
        return (info.user, info.uid, info.isBound, info.timestamp);
    }

    /// @notice Unbind your account (in case you need to rebind elsewhere)
    function unbindAccount() external {
        require(bindings[msg.sender].isBound, "Not bound yet");
        delete bindings[msg.sender];
        emit Unbound(msg.sender);
    }
}
