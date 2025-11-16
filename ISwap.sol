// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ISwap {
    struct SwapData {
        address initiator;
        address participant;
        uint256 amount;
        bytes32 secretHash;
        uint256 deadline;
        bool claimed;
        bool refunded;
        address tokenAddress; // zero for ETH
    }

    function initiateSwap(
        bytes32 swapId,
        address participant,
        bytes32 secretHash,
        uint256 timelockSeconds,
        address tokenAddress,
        uint256 tokenAmount
    ) external payable;

    function claim(bytes32 swapId, bytes calldata secret) external;
    function refund(bytes32 swapId) external;
    function getSwap(bytes32 swapId) external view returns (SwapData memory);
}
