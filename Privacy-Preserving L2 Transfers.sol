// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PrivacyPreservingL2 {
    address public admin;
    mapping(bytes32 => bool) public nullifiers;

    event PrivateTransfer(address indexed sender, bytes32 commitment);

    constructor() {
        admin = msg.sender;
    }

    function submitProof(bytes32 proof, bytes32 nullifier) external {
        require(!nullifiers[nullifier], "Nullifier already used");
        nullifiers[nullifier] = true;
        emit PrivateTransfer(msg.sender, proof);
    }
}